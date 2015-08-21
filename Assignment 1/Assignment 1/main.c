#include <stdio.h>
#include <math.h>

/*
 * Function: compute
 * -------------------
 * This is a code snippet of Question 6
 *
 * parameter n: any integer number
 *
 * returns: float
 */
float compute (int n) {
	float y = 1.1;
	
	for (int k = 0; k < n; k++)
		for (int j = 0; j < n; j++) {
			y = sin(k * j + y);
			printf("%f", y);
		}
	
	return y;
}

/*
 * Function: polyTable
 * -------------------
 * This method prints out on the console the values k and the k^3+2*k-3
 * where k = 1, 2...n
 *
 * parameter n: any integer number
 *
 * returns: void
 */
void polyTable (int n){
	for (int k = 1; k <= n; k++) {
		printf("k = %d, (k^3)+(2*k)-3 = %d \n \n", k, (k * k * k) + (2 * k) - 3);
	}
}

/*
 * Function: runningSum
 * --------------------
 * It calculates the sum of current and past values
 * of the argument passed to this function
 *
 * parameter n: any integer number
 *
 * returns: an integer, sum of current and past argument values
 */
int runningSum (int n){
	static int previousSum = 0;
	
	previousSum = previousSum + n;
	
	return previousSum;
}

/*
 * Function: fibonacci
 * --------------------
 * It calculates Nth fibonacci for any positive integer N.
 *
 * parameter n: any integer
 *
 * returns: -1, for negative integers otherwise returns Nth fibonacci number
 */
int fibonacci (int n){
	int output;
	
	if (n <= 0){
		output = -1; // error case
	} else if (n == 1 || n == 2) {
		output = 1;
	} else if(n > 2){
		output = fibonacci(n - 1) + fibonacci(n - 2);
	}
	
	return output;
}

int main (int argc, const char * argv[]) {
    int n = 7; // intialize n with any random integer
	
	printf("\n***************************** \n");
	printf("\nOutput of method polyTable: \n\n");
	
	/* Solution to Question 1 */
	polyTable(n);
	
	printf("\n***************************** \n");
	printf("\nOutput of method runningSum: \n\n");
	
	/* Solution to Question 3 */
	int x1 = runningSum(2);
	printf("x1 = %d \n", x1);
	
	int x2 = runningSum(2);
	printf("x2 = %d \n", x2);
	
	int x3 = runningSum(3);
	printf("x3 = %d \n", x3);
	
	int x4 = runningSum(5);
	printf("x4 = %d \n", x4);
	
	printf("\n***************************** \n");
	printf("\nOutput of method fibonacci: \n\n");
	
	/* Solution to Question 5 */
	int output = fibonacci(n);
	
	if(output != -1){
		printf("When n is %d, Fibonacci value = %d \n", n, output);
	} else{
		printf("Error: Positive integer is expected");
	}
	
	printf("\n***************************** \n");
	
	/* Added to use Time Profiler for Question 6 */
	//compute(1100);
	
    return 0;
}


