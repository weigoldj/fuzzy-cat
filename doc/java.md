## JAVA 
<p>
  Java Platform has two components, JVM and Java API
  statically typed.  All variables
  compiled into bytecode for the JVM and interperted at run time by the JVM
</p>

### VARIABLES
8 primitive types { byte, short, int, long, float, double, boolean, char };


### ARRAY  - *java.util.Arrays*

**Array Initalization**
declares an array of integers
``` nt[] anArray; ```

declares an array with enough memory to hold 10 integers
``` anArray = new int[10]; ```

creates and intializes the array.
``` int[] anArray = { 1, 2, 3, 4, 5 }; ```  

Multidimensional array 
``` String[][] names = { "train", "plane", "car"}, { "diesel", "kerosene", "gas" }}; ```

**Copy**
arraycopy given two defined arrays, give start position in each array and length of the copy.
``` System.arraycopy(arr1, int start_pos, arr2, start_post, int length); ```

copy array with one defined array
``` int[] tmp = java.util.Arrays.copyOfRange(arr1, int start_pos, int length); ```


**ARRAYLIST**
acts like an array that can grow or 
```
ArrayList<Sting> obj = new ArrayList<String>();
obj.add("HELLO");
obj.add(1,"GOODBYE");
obj.remove("HELLO");
```

**Loop**
```
for(String str : obj) {
  System.out.println(str);
}
```

**Iterator Loop**
```
Iterator itr = obj.iterator();
while(iter.hasNext()) {
  System.out.println(iter.next());
}
```

**LIST**
```
List<String> list = new ArrayList<>();
list.forEach(v -> System.out.println(v))
```

# hash
 Hashtable<String, Integer> numbers = new Hashtable<String, Integer>();
   numbers.put("one", 1);
   numbers.put("two", 2);
   numbers.put("three", 3);

To retrieve a number, use the following code:

 Integer n = numbers.get("two");
 if (n != null) {
   System.out.println("two = " + n);
 }


**CONTROL STATEMENTS**
if than else
```
if(condition) {
  do something;
}
else {
  else do this;
}
```

**Switch**, be careful of fall thrus and not defining defaults.
```
switch(value) {
  case "value1":  
    do something;
    break;
  case "value2" case "value3":
    do something for value 2 and 3;
    break;
  default: do something;
    break;
}
```

#### LOOPS 
**WHILE LOOP**
infinite loop.
```
while(true) {
  do something
}
```

do while, executed atleast once.
```
do { 
  do something
} while (true);
```

#----- For loop
for (int i = 0; i < 10; i++ )  { do something; };  
for (;;) { infinite loop }; 

// iterate over collections or arrays
for (int item : array ) {  do something } ;

#--- Break
// unlabled break is most common and used in switch or exiting inner loops.
// labeled break allows you to exit out of an outer loop.

search:
  while(true) {
    if(condition) break search;
  }

// Return
// can return or not return a value, returns to the calling method.
// use "return" if the method is declared 'void'.


#--- CLASS
# first letter capitiliazed.
# first word in a method should be a verb.
class MyClass extends MySuperClass impmlements interface1, interface2 {

}


#--- INTERFACE
// If the interface is not defined as public then it can be used
// only by classes in the same package.
//  * all fields aer public static and final
//  * all methods are public
//  * you can implement any number of interfaces
public interface GroupInterface extends Interface1, Interface2 {
  // abstract method has no implementation
  int doSomething(String s);  
}


#--- THREADS (CONCURENCY)
// provide a runable object by implementing Runnable
public class RunMe implements Runnable {
  public void run() { System.out.println("hello"); }
  public static void main(String args[]) { (new Thread(new RunMe())).start(); }
}

// Subclass Thread, the class Thread implements Runnable.  Provide implementation
// for run.
public class RunMe extend Thread { 
  public void run() { System.out.println("hello");}
  public static void main(String args[]) { (new RunMe().start() ; }
}

// SELECT A RANDOM FILE
File folder = new File("images/gallery/");
File[] listOfFiles = folder.listFiles();
     
Random rand = new Random();
int x  = rand.nextInt(listOfFiles.length);

// ARRAYS 

int[] array = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1};

	List<String> crunchifyList = new ArrayList<String>();
 
		// add 4 different values to list
		crunchifyList.add("eBay");
		crunchifyList.add("Paypal");
		crunchifyList.add("Google");
		crunchifyList.add("Yahoo");
 
		// iterate via "for loop"
		System.out.println("==> For Loop Example.");
		for (int i = 0; i < crunchifyList.size(); i++) {
			System.out.println(crunchifyList.get(i));
		}
 
		// iterate via "New way to loop"
		System.out.println("\n==> Advance For Loop Example..");
		for (String temp : crunchifyList) {
			System.out.println(temp);
		}
 
		// iterate via "iterator loop"
		System.out.println("\n==> Iterator Example...");
		Iterator<String> crunchifyIterator = crunchifyList.iterator();
		while (crunchifyIterator.hasNext()) {
			System.out.println(crunchifyIterator.next());
		}


// maps
Map<KeyClass, ValueClass> myMap;

// Iterate all keys
for (KeyClass key  : myMap.keySet()) 
    System.out.println(key);

// Iterate all values
for (ValueClass value  : myMap.values()) 
    System.out.println(value);

// Iterate all key/value pairs
for (Entry<KeyClass, ValueClass> entry  : myMap.entrySet()) 
    System.out.println(entry.getKey() + " - " + entry.getValue());


