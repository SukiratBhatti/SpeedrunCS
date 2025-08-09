#include <iostream>
using namespace std;

typedef int item;

void swap(item *a, item*b){
    item temp = *a;
    *a=*b;
    *b=temp;
}

void insertion_sort(item s[], int n){
    int i, j;
    for (i=1; i<n; i++){
        j = i;
        while ((j>0) && (s[j] < s[j-1])) {
            swap(&s[j], &s[j-1]);
            j = j-1;
        }
    }
}

int main(){
    item arr[] = {5,2,9,4,1};
    int n = sizeof(arr) / sizeof(arr[0]);

    insertion_sort(arr, n);

    for (int i = 0; i<n; i++){
        cout << arr[i] << " ";
    cout << endl;
    }

    return 0;
}