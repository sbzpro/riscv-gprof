/*See LICENSE of license details.*/
#include "encoding.h"
#include "semihost.h"
#include "proto.h"



int  PROFILE delay(){
	extern void test(void);
	 int count=0,local = 0;
	  while (local < 8000) {
	               local++;
	               if(local % 50 == 0)
	                count ++;
	           }
	  test();
	  return count;
}



int PROFILE main()
{

	int j,i=0,count=0;

     for(j=0;j<800000;j++);

		while(i<0x500){
			count = delay();
			i++;
		}

	return 0;
}
