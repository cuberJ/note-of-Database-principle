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



### 数据类型

1. 显示数据类型：

   ```scala
   val a = 100.var//回车后可以编辑变量的类型，类型不用指定
   var b = 200 //val是变量，相当于const。var是可变变量
   ```

2. 类

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
   val age = 20
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
def func(s: String): 
```

