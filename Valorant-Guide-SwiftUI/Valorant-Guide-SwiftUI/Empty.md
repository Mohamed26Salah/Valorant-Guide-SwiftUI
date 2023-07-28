#  Info To Know

The @escaping keyword indicates that the closure can escape the scope in which it is defined. This means that the closure can be stored in a variable or property and be called later, after the function that defines it has returned. This is commonly used in asynchronous operations, where the closure is called at some point in the future when the operation completes.

The Result<Data, Error> type is an enumeration that represents either a success with an associated Data value or a failure with an associated Error value. This means that when the closure is called, it will be passed either a Data value representing the successful result of some operation or an Error value representing the failure of that operation.
