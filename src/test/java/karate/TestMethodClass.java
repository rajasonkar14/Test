package karate;

public class TestMethodClass {

	public void nonStaticMethod() 
	{
		System.out.println("In non static method without argument");
	}
	
	public static void staticMethod() 
	{
		System.out.println("In static method without argument");
	}
	
	public void nonStaticMethodWithArgs(Object args) 
	{
		System.out.println("In non static method with argument :"+ args);
	}
	
	public static void staticMethodWithArgs(Object args) 
	{
		System.out.println("In static method without argument :"+ args);
	}
}
