void main()
{
   int matrix[2][2]={1,2,3,4};     //The first square matrix
   int matrix2[2][2]={5,6,7,8};    //The second square matrix
   int new[2][2]={0};              //The result of the multiplication
   int i,j,k;
   for(i=0;i<2;i++){
    for(j=0;j<2;j++){
      for(k=0;k<2;k++)
        new[i][j]+=matrix[i][k]*matrix2[k][j]; 
     } 
  }
}
