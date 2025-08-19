#include <stdio.h>
#include <assert.h>

int increment(int y) {
    assert(y>=0);
    if (y == 0) return 1;
    if (y&1) // odd num
        return 2 * increment(y >> 1);
    else  // even
        return y + 1;
}

int main(void) {
    for(int y = 0; y < 10; y++){
        printf("%d -> %d\n", y, increment(y));
    }
    return 0;
}