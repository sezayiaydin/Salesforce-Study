Calculator c = new Calculator();
Integer b=c.colculateStringLength('Hello');
System.debug('s1 Length---> '+b);

integer a = c.add(8, 7, 6);
system.debug('8+7+6 => ' + a);


integer x = c.add(10, 5);
system.debug('sum of 10 and 5 is ' + x);
integer y = c.add(11111,11111);
system.debug(' y is ' + y);



string result = c.printAndReturnMessage('Print this ASAP');
system.debug(result);







c.printNewMessage('This is new age calc.');

string msg = 'Print this now.';
c.printNewMessage(msg);

string msg99 = 'Now this.';
c.printNewMessage(msg99);

//Integer msg1 =8888;
// not working 
//c.printNewMessage(msg1);
