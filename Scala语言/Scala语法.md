# Scala语法

## 基础语法

### 基本运行main函数

```scala
object Lesson_ClassAndObj{
    def main(args:Array[String]): Unit = {
        val a = 100;
        println(a)
    }
}
```



#### 输入控制

```scala
import io.StdIn._
var i = readInt() // 读入一个int型
//如果是float就是readFloat
var i = readLine("Please input the sentence") //直接读取一行，包括空格
```





### 数据类型

1. 显示数据类型：

   ```scala
   val a:Int= 100//回车后可以编辑变量的类型，类型不用指定,如果需要指定，则采用冒号+数据类型的方式
   var b = 200 //val是变量，相当于const。var是可变变量
   ```

2. `a 方法b ` 等价于 `a.方法（b）`

   ```scala
   val sum = 5 + 3 //+是一个方法，和下面的表述方式等价
   val sum = (5).+(3)
   ```

   

3. 类

   ```scala
   class Person(var xname: String, xage:Int){
       //类声明的时候需要带一个小括号，用来指定传参类型,类型必须指定
       //虽然要指定类型，但var或者val这两种静态与否的格式并不要求指定
   }
   
   val p = newPerson(xname = "cai", xange=20)
   println(p.xname)
   ```




### 常见语法

1. if  else

   ```scala
   val age: Int = 20
   if(age <=20)
   {
       println("20")
   }
   else if(age > 30)
   {
       println("30")
   }
   else
   {
       println("25")
   }
   ```

   

2. for循环

   ```scala
   val r = 1 to 10 //1 to 10是一个Range集合，r代表这个1到10的集合，to和until都是函数
   for(i <- 1 to 10)
   {
       println(i) //集合中数字包含10，集合中数字从1到10
   }
   for(i <- i until 10)
   {
       println(i) //until不包含10，集合中数字从1到9
   }
   val r = 1.to(10,2) //表示从1到10，步长为2，打印的结果为Range(1,3,5,7,9)
   //步长的另一种写法是by
   val r = 1.to(10) by 2
   //同理，to可以支持浮点数和其他类型的变量
   val r = 0.5f to 5.9f by 0.8f
   
   for(i <- 1 until 10)
   {
       for(j <- 1 until 10)
       {
           print(s"$i * $j = $s*$j") // 采用$符号+变量名可以直接调用变量值，和shell一样。print和println的区别仅在于，println打印会自带回车
           printf("%d * %d = %d",i, j, i*j) //也可以采用这种C风格的printf函数打印
       }
   }
   
   /*如果需要带有判断条件的话*/
   for(i <- 1 to 1000; if(i>500); if(i%2 == 0)) // for中带的if仅仅是条件判断，但不作为终止
   {
       print(i); // 打印所有值大于500的偶数
   }
   // 这个for可以直接生成一个集合
   val result = for(i <- 1 to 1000; if(i>500); if(i%2 == 0)) yield i
   //得到的result是一个vector容器，里面存放的是所有大于500的偶数
   ```

   

3. while与do

   ```scala
   var i = 0;
   while(i < 100)
   {
       println(i)
       i = i+1 // scala没有i++的写法，但有i+=1的写法，和Python一样
   }
   ```

   

## 方法与函数定义

### 方法

```scala
def max(x:Int, y: Int): Int = { //结构：def开头，函数名，传入参数与类型，冒号，返回值类型
    if( x > y)
    	return x //如果不写return，方法会自动将最后一行的计算结果作为返回值，类型如果没有指定，就自动推断。所以如果方法不定义返回值类型的话，必须要省略return，使用了return，就一定要指定返回类型
    else
    	return y
}
val result: Int = max(100,200)
```



 #### 递归

```scala
def func(num: Int): Int = { //递归一定要显式声明返回值类型
    if(num == 1)
    	return 1
    else
    	return num*func(num-1)
}
```



#### 参数

```scala
//默认参数值
def func(a: Int=10, b:Int=20): Int = { // 默认a为10,b为20，和Python的一样的覆盖方式
    return a + b
}
val result = func(a=5) // 则传入的a=5，b=20，返回值25

//可变长参数的方法
def func(s: String*): Unit = { //在String后面加个*可以传入任意多个字符串
    println(s)
} 
```



#### 偏应用函数

```scala
//应用场景：一个函数的传入参数中，只有一个在变化，其他的都固定不变，则可以使用偏应用函数
val date = new Date()
def showDate(date, user:String): Unit={
    println(s"$date by $user")
}
//现在假如user在调用showDate的时候会不断变化
def func = showDate(date, _:String) //下划线表示会变化的变量
func("abc")//打印的结果中，user的名字就是abc，不需要额外显式传递date这个参数
```



#### 高阶函数

1. 方法的参数是函数

   ```scala
   def func1(a:Int, b:Int):Int = {
       return a+b
   }
   
   def func2(f:(Int, Int)=>Int, s:String): Unit = { // 传入参数是函数f的时候，括号内是函数f的传入参数，箭头指向f的返回值
       println(func1(100, 200))
   }
   func2(func1, "test")
   ```

   



2. 方法的返回是函数

```scala
def func1(s:String):(String, String)=>String = {
    def func2(a:String, b:String): String = {
        return a+b
    }
    return func2
}
```





3. 方法的参数和返回都是函数



# 数据结构

## 列表List

1. List中所有元素如果采用val的方式声明，内部的元素可以修改，但是指向的数组不能变

   > 例如：
   >
   > ```scala
   > val test = List("barry", "Allen")
   > ```
   >
   > test里面的元素可以修改，但test这个变量必须指向这个List，不能再改为指向其他的List

   1. 可以采用head方式返回列表的第一个值
   2. 可以用tail返回除了第一个值以外的所有值 

2. 列表的构造方法

   1. 直接声明

   2. 在一有列表<u>**前端**</u>直接加入

      ```scala
      val list1 = ("a","b","c")
      val list2 = "d" :: list1
      //list2此时为（"d","a","b","c")
      ```

   3. 采用Nil方式。Nil本身是一个空列表对象，可以借助Nil将多个元素用`::`串连起来

      ```scala
      val intList = 1::2::3::Nil
      //等价于
      val intList = List(1,2,3)
      ```




## 集合set

采用哈希映射，能够快速找到存储的元素。注意，这个set不是字典

集合分为可变集合和不可变集合。默认是不可变集合

```scala
var mySet = Set("123","456")
mySet += "789" // 虽然这里默认采用了不可变集合，但是mySet是var类型，表示mySet作为指针可以指向其他的Set。加入了789字符串相当于在内存中开辟了新的Set，让mySet指向了这个Set
```



## Map映射

```scala
val university = Map("XMU"->"xiamen", "THU"->"tsinghua")
val xmu = if(university.contains("XMU")) university("XMU") else 0
println(xmu)
//添加新元素两种方式
university += ("Beijing"->"beijing", "Test"->"test") // 可以一次加入多个键值对
university("Beijing") = "beijing"
//注意，必须使用可变映射才可以添加键值对，此时需要引入可变映射包
import scala.collection.mutable.Map 
```



### 遍历映射

```scala
for((k,v)<- university) printf("%s 's anthor name is %s'",k,v)
//如果只打印键
for(k<-university.keys) printf("%s is one of the key",k)
```



## 数组Array

```scala
val intValue = new Array[Int](3) //Int型初始化为0
intValue(0) = 1
val strValue = new Array[String](3) //string初始化为null
for(i <- 0 to 2) printf("%s is the value", strValue(i))
```

 

### 多维数组

```scala
val myMatrix = Array.ofDim[Int](3,4) // 定义的是一个三行4列的二维数组
val myMatrix = Array.ofDim[String](3,4,5) // 定义的是一个3行4列5高的三维数组
```



### 可变长数组

```scala
import scala.collection.mutable.ArrayBuffer
val A = ArrayBuffer(10,20,30)
A += 40 //数组变为10，20，30，40
a.insert(2,60,40) //数组在第二个元素后插入60和40，变为10，20，60，40，30，40
a -= 40 //删去第一个为40的数值
var temp = A.remove(2) // 删去第二个元素
```



## 元组

元组是不同类型的值的聚集，可以包含多种不同元素

```scala
val tuple = ("Big", 2010, 54.2)
print(tuple._1) //打印出Big
```

