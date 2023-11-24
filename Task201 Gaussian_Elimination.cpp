#include<bits/stdc++.h>
using namespace std;
int main(){
    int n=3,i,j,k;
    cout.precision(3);
    float mat[n][n+1] = { {25,5,1,106.8}, {64,8,1,177.2},{144,12,1,279.2} };
    float ans[n];

    //Pivotisation
    for (i=0;i<n;i++){
        for (k=i+1;k<n;k++){
            if (abs(mat[i][i])<abs(mat[k][i])){
                for (j=0;j<=n;j++)
                {
                    double temp=mat[i][j];
                    mat[i][j]=mat[k][j];
                    mat[k][j]=temp;
                }
            }
        }
    }

    //forward-substituiton
    for(i=0;i<n-1;i++){
        for(k=i+1;k<n;k++){
            double t = mat[k][i]/mat[i][i];
            for(j=0;j<=n;j++){
                mat[k][j] = mat[k][j] - t * mat[i][j];
            }
        }
    }

//    for(i=0;i<n;i++){
//        for(j=0;j<=n;j++){
//            cout<<mat[i][j]<<" ";
//        }
//        cout<<endl;
//    }

    //back-substituiton
    for (i=n-1;i>=0;i--)
    {
        ans[i]=mat[i][n];
        for (j=i+1;j<n;j++)
            if (j!=i)
                ans[i]=ans[i]-mat[i][j]*ans[j];
        ans[i]=ans[i]/mat[i][i];
    }
    cout<<"Ans no 1 :\n";
    for(i=0;i<n;i++) cout<<"    a"<<i+1<<"\t =\t"<<ans[i]<<endl;

    cout<<"Ans no 2 :\n";
    double v = ans[0]*6*6 + ans[1]*6 + ans[2];
    cout<<"    velocity at t=6 second : v = "<<v<<endl;



}

