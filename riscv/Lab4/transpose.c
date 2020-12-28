#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <time.h>
#include<string.h>

float result_naive[5];
float result_blocking[5];
    
/* The naive transpose function as a reference. */
void transpose_naive(int n, int blocksize, int *dst, int *src) {
    for (int x = 0; x < n; x++) {
        for (int y = 0; y < n; y++) {
            dst[y + x * n] = src[x + y * n];
        }
    }
}

/* Implement cache blocking below. You should NOT assume that n is a
 * multiple of the block size. */
void transpose_blocking(int n, int blocksize, int *dst, int *src) {
    
      for (int x = 0; x < n; x+=blocksize) {
        for (int y = 0; y < n ; y+=blocksize) {
          for(int i=x ; i < x+blocksize ; i++){      //transpose each block
           for(int j=y ; j < y+blocksize ; j++){
              if( i<n && j<n){
                dst[j + i * n] = src[i + j * n];
               }
            }
        }
    }
}
}
void benchmark(int *A, int *B, int n, int blocksize,
    void (*transpose)(int, int, int*, int*), char *description,int k) {
        int i, j;
    printf("Testing %s: ", description);

    /* initialize A,B to random integers */
    srand48( time( NULL ) );
    for( i = 0; i < n*n; i++ ) A[i] = lrand48( );
    for( i = 0; i < n*n; i++ ) B[i] = lrand48( );

    /* measure performance */
    struct timeval start, end;

    gettimeofday( &start, NULL );
    transpose( n, blocksize, B, A );
    gettimeofday( &end, NULL );

    double seconds = (end.tv_sec - start.tv_sec) +
        1.0e-6 * (end.tv_usec - start.tv_usec);
    printf( "%g milliseconds\n", seconds*1e3 );
    
    if(transpose==transpose_naive)
      result_naive[k]=seconds*1e3;
    else
      result_blocking[k]=seconds*1e3;
    /* check correctness */
    for( i = 0; i < n; i++ ) {
        for( j = 0; j < n; j++ ) {
            if( B[j+i*n] != A[i+j*n] ) {
                printf("Error!!!! Transpose does not result in correct answer!!\n");
                exit( -1 );
            }
        }
    }
   }

int main( int argc, char **argv ) {
    FILE *fp=fopen("result.txt","w");
    if(!fp)
      printf("error");
    if(!strcmp(argv[1],"1")){
      int n[5]={100,1000,2000,5000,10000};   
      int blocksize = 20;    
      int i;
      for(i=0;i<5;i++)
     {
       int *A = (int*)malloc( n[i]*n[i]*sizeof(int) );
       int *B = (int*)malloc( n[i]*n[i]*sizeof(int) );

       benchmark(A, B, n[i], blocksize, transpose_naive, "naive transpose",i);
       benchmark(A, B, n[i], blocksize, transpose_blocking, "transpose with blocking",i);
    
       free( A );
       free( B );
      }
    }
    else{
      int blocksize[5]={50,100,500,1000,5000};
      int n=10000;
      int i;
      for(i=0;i<5;i++)
     {
       int *A = (int*)malloc( n*n*sizeof(int) );
       int *B = (int*)malloc( n*n*sizeof(int) );

       benchmark(A, B, n, blocksize[i], transpose_naive, "naive transpose",i);
       benchmark(A, B, n, blocksize[i], transpose_blocking, "transpose with blocking",i);
    
       free( A );
       free( B );
      }
    }
    int i;

    for(i=0;i<5;i++){
      fprintf(fp,"%g\n",result_naive[i]);
      fprintf(fp,"%g\n",result_blocking[i]);
    }
    return 0;
}
