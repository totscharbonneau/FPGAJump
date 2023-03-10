#include "scaler.h"
#include "vdma.h"
#include "xil_printf.h"
#include "API.h" // Contains the defines and functions BASEADDR are in xparameters.h
#include "sleep.h"

int main()
{
	configureScaler();
    configureVdma();

    int colorA = 0;
    int colorB = 0xFF;
    API_mWriteReg(	XPAR_API_0_S00_AXI_BASEADDR,
    						API_S00_AXI_SLV_REG2_OFFSET,
							colorA);

    while(1)
    {
    	API_mWriteReg(	XPAR_API_0_S00_AXI_BASEADDR,
    							API_S00_AXI_SLV_REG2_OFFSET,
								colorA);
    	colorA += 1;
    	usleep(50000);
    }

    return 0;
}
