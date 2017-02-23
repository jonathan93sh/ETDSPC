//============================================================================
// Name        : Counter_and_7seg.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hps_0.h"
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"


#define HW_REGS_BASE ( ALT_STM_OFST )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

using namespace std;



int main() {

	void *virtual_base;
	int fd;
	void *counter;

	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}

	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );

	if( virtual_base == MAP_FAILED ) {
			printf( "ERROR: mmap() failed...\n" );
			close( fd );
			return( 1 );
		}


	counter=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + UPCOUNTER_0_BASE ) & ( unsigned long)( HW_REGS_MASK ) );


	cout << "Count value is: " << *(int*)counter << endl; // prints !!!Hello World!!!
	return 0;
}
