//Normal
Cat sf =new Cat();//will not work beccause which is expected parameters
sf.name='Kitty';
sf.color='Black';
System.debug(sf);

//Constructor
Cat siCat=new Cat('Fluffykins', 'White');
System.debug(siCat);

Cat vk=new Cat('Van ', 'White');
System.debug(vk);

Cat s=new Cat('Simbo', 'Brown');
System.debug(s);