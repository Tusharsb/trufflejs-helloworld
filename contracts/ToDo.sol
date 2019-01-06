pragma solidity ^0.5.0;

contract ToDo {
    
    struct ToDoItem{
        string label; //the todo string
        uint256 assignedDate; //when the task was assigned. Timestamps are stored in unix timestamp format
        uint256 completionDate; //when the task was completed.
        bool status; //whether task is complete
    }
    
    event ToDoAdded(string label,uint256 id);
    
    // a persistent list of ToDo Items. Because it is public, it can be read using web3 JSON RPC or web3.js
    ToDoItem[] public ToDoItems;
    
    // let user createTask by giving input of 'label'. because it is 'public' hence it can be called by any programmer from their web application. 
    function createTask(string memory label) public returns(uint256) {
        
        // Create a temporary variable that will be used to hold the data of todo item
        // because it declared using 'memory' hence this variable will be destroyed after end of this function 
        ToDoItem memory _ToDoItem;
        
        _ToDoItem.label = label; // assign the label of todo
        _ToDoItem.assignedDate = now; // assign current time
        
        ToDoItems.push(_ToDoItem); //push the temporary todo into the persistent array of ToDo Itemss
        
        emit ToDoAdded(label,ToDoItems.length);
        return ToDoItems.length; // return the total count of to dos added so far. not being used anywhere though
    }
    
}