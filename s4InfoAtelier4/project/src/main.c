#include "scaler.h"
#include "vdma.h"
#include "xil_printf.h"
#include "ppu_api_rx.h" // Contains the defines and functions
#include "sleep.h"

int main()
{
	configureScaler();
    configureVdma();

    int colorA = 0;
    int colorB = 0xFF;
    PPU_API_RX_mWriteReg(	XPAR_PPU_API_RX_0_S00_AXI_BASEADDR,
    						PPU_API_RX_S00_AXI_SLV_REG2_OFFSET,
							colorA);

    while(1)
    {
    	PPU_API_RX_mWriteReg(	XPAR_PPU_API_RX_0_S00_AXI_BASEADDR,
								PPU_API_RX_S00_AXI_SLV_REG2_OFFSET,
								colorA);
    	colorA += 1024;
    	sleep(1);
    }

    return 0;
}
