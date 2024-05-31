A26)
(a) begin-end:
· Used to model the statements which need to be executed sequentially.
· Statements between begin and end are processed top to bottom.
· Delay values are relative to the execution of the previous statement
· Control passes out of the block when the last statement is executed.
(b) join-fork:
· Used to model parallel blocks.
· Statements between join and fork are executed concurrently.
· All delays are absolute time or relative to the start point of the block.
· Parallel blocks start when the fork statement is executed.
