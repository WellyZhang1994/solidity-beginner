# Solidity Beginner Notes

---
## Local Variable, State Variable, Global Variable

- Local Variable 將變數宣告於 function 之中，其生命週期僅會在 function 內執行時運作，並且不會儲存於區塊鏈中。


    ```solidity
    function test() external pure returns(uint){
        uint localVar = 456;
        return localVar;
    }
    ```
- State Variable 宣告後會將其儲存於區塊鏈中，其宣告會被在合約內、Function 外。

    ```solidity
    contract stateVariable {

        //The var1 is a state variable and it can be stored on the blockchain.
        //The state variabel is declared inside the contract but out side the function.
        uint public var1 = 123;

        function test() external pure returns(uint){
            // The var2 is a local variable and it can only live in the function runtime.
            uint var2 = 456;
            return var2;
        }
    }
    ```
    
- Global Variable 為以太坊全域可調用的變數，用來取得區塊鏈上的資訊，其變數清單如下:

    | Name | Return |
    | ------ | ------ |
    | blockhash(uint blockNumber) returns (bytes32) | 取得區塊的 Hash |
    | block.coinbase (address payable)| 目前正在挖該區塊的地址|
    | block.difficulty (uint) | 目前的區塊難度 |
    | block.gaslimit (uint) | 目前的區塊 Gas 上限 |
    | block.number (uint) | 目前的區塊高度 |
    | block.timestamp (uint) | 從 UNIX 紀元開始算起現在過了多少秒數 |
    | gasleft() returns (uint256) | 剩餘的 Gas |
    | msg.data (bytes calldata) | 完整的 Input Data |
    | msg.sender (address payable) | 發送合約的地址 |
    | msg.sig (bytes4) | 紀錄 Calldata 的前四個 bytes 的資訊 |
    | msg.value (uint) | 取得發送到合約的 value |
    | now (uint) | 取得現在的區塊時間 |
    | tx.gasprice (uint) | 取得該筆交易的 Gas 費用 |
    | tx.origin (address payable)| 取得該交易的傳送者|
    
    
## Value Type, Reference Type

- Value Type 為 Solidity 變數中的一種，屬於 Call By Value 的形式，在傳入 Function 時，會額外複製一份，其值會被定義於 Memory 中，常見的範例有: `uint` `int` `bool` `address` `bytes` `enums`
- Reference Type  類似於 Call By Reference 概念，其儲存的值為區塊的地址而非內容本身，常見的範例有: `fixed array` `dynamic array` `structs` `mapping`

## Function visibility

|  Visibility | Access within contract | Access within derived contract | Access from external contract|
| ------ | ------ | ----- | ----- |
|`public (default)` | Yes | Yes | Yes |
|`external` | No | No | Yes |
|`private` | Yes | No | No |
|`internal` | Yes | Yes | No |

## State variable visibility
|  Visibility | Access within contract | Access within derived contract | Access from external |
| ------ | ------ | ----- | ----- |
|`public` | Yes | Yes | Yes |
|`private` | Yes | No | No |
|`internal(default)` | Yes | Yes | No |

## Solidity State Mutability

- View 僅會讀取鏈上的資料但不會寫資料於區塊鏈中，換句話說就是不能更改 EVM 的狀態，以下事件都會被列入更改狀態

    1. 修改 State Variable
    2. 產生 Event
    3. 創建其他合約
    4. 呼叫任何沒有標記 View or Pure 的 Function

- Pure 既不能讀取也不能寫入鏈上資料，以下行為表示從鏈上讀取資料

    1. 讀取 State Variable
    2. 讀取地址的 Balance
    3. 讀取 Global Variable
    4. 呼叫任何非 Pure 的 Function

## Data location 

好文: https://betterprogramming.pub/solidity-tutorial-all-about-data-locations-dabd33212471

- 談到 Data location 前，先提到 EVM 的運作，Smart Contract 在沒有被呼叫時是不會運作的，而 EVM 會透過眾多節點執行 EVM Client 不斷的運作，並且提供 Smart Contract 運行 opcode 的環境，而 opcode 會讓 EVM 去讀取或是存取區塊鏈中不同位置的資料，去確保智能合約能夠運行順利，而不同位置的資料就是其標題的 Data location。而不同的 Data location 有不同的作用其中也會影響到合約呼叫時的 Gas，在 EVM 中，主要分為以下五種：

    1. Storage: 每一個智能合約中的地址都擁有一個屬於自己地址的 Storage，以 Key-Value 形式儲存，會儲存所有合約中的 State Variable，在 EVM 環境中的 OPCODE 以 SSTORE/SLOAD 作為讀取或寫入。
    2. Memory: 在智能合約中提供一個暫時的存放值的地方，會在外部呼叫 function 後釋放掉，比起 Storage，費用也更為便宜。
    3. Calldata: 從 Client 端傳送交易時的資料或是參數於 external function 的值為 calldata，這些資料為 read-only，無法覆寫。
    4. Stack: 用來儲存小型的 Local Variable，使用費用很便宜，但有限定一定的數量及大小，主要用於 function 內部執行時使用。
    5. Code: 這邊的 code 指的就是合約的 bytecode，可以讀取但無法寫入，可以找到在合約中定義為 Constant 的變數。
    
## Default Value
- 談到 default value 前，與其他語言最不同的地方在於 Solidity 沒有 null, undefiend, nil or None 等相關值，各種值若沒有賦予值時，通常用 0 或是各類型的 default value 為代表。Default value 主要可以分為 `dynamically`、`non dynamically`。
- non dynimically: 
    1.`int` `uint` 預設值為 0
    2.`bool` 預設值為 false
    3.`address` 預設值為 0x0000000000000000000000000000000000000000
    4.`enum` 預設值為 first element (0)
- dynamically:
    1.`string` 預設值為空字串
    2.`array` 預設值為空陣列
    3.`struct` 預設值為 tuple 包含所有內容物的預設值
    4.`bytes` 預設值為 empty or nobyte

## Constructor

- Solidity 的 Constructor 可以讓智能合約部署前給定一初始參數（如合約創始者的地址）而當有多個合約繼承且每個合約都需要 Constructor 時，我們可以在入口合約採直接指定（directly specify）或是採修飾詞（modifier）的方式給予初始值。

## Event

- Event 可以讓使用者輕鬆與 EVM 的 logging 系統運作，可以使用 dapp 監聽合約的事件，取得最新的狀態，


## Indexed

- 在 event 中，可以將 event 的參數設定為 indexed，提供 client 端可以執行 filter，但一個 event 中最多只能設定 3 個 indexed，藉此方便查找。

