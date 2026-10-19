#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>

extern int32_t square_i8(int32_t);

int main(void) {
  setvbuf(stdout, NULL, _IONBF, 0);
  printf("%" PRId32 "\n", square_i8(12));
  return 0;
}
