var Todo = artifacts.require('./ToDo.sol');

contract ('ToDo',(accounts) => {
    let contractInstance
    let todoAdded

    before (async()=>{
        contractInstance = await Todo.deployed();

    })

    it("A string todo is being added successfully", async()=>{
        await contractInstance.createTask('Task1');
        todoAdded = await contractInstance.ToDoItems(0);

        assert(todoAdded[0] == 'Task1', 'Failed to add the Todo!');
    })


    it("Unauthorized account should NOT be able to call createTask", async()=>{
        try{
            await contractInstance.createTask('Task2',{from:accounts[1]});
        }
        catch(e){}
        try{
            todoAdded = await contractInstance.ToDoItems(1);
        }
        catch(e){}

        assert(todoAdded[0] != 'Task2', 'Unauthorized acount was able to call createTask!');
    })
})