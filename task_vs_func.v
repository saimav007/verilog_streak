A23) Differences between Functions/Tasks:
1. Functions must have atleast one input argument.Tasks can have zero or more
arguments.
2. Functions return always a single value. Tasks do not return with a value but can pass
multiple values through output and inout arguments.
3. Functions must not have delay, event or timing control statements. Tasks may contain
delay, event or timing control statements.
4. Function can enable another function only but not another task whereas Task can
enable other functions and tasks.
