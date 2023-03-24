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

## Default Value

## Constructor

## Indexed

## Event

