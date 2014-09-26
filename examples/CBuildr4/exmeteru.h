//---------------------------------------------------------------------------
#ifndef ExMeteruH
#define ExMeteruH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcMeter.hpp"
#include "OvcBase.hpp"
#include "OvcPeakM.hpp"
#include <vcl\ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TOvcMeter *OvcMeter1;
	TOvcMeter *OvcMeter2;
	TOvcPeakMeter *OvcPeakMeter1;
	TOvcPeakMeter *OvcPeakMeter2;
	TOvcMeter *OvcMeter3;
	TOvcMeter *OvcMeter4;
	TOvcMeter *OvcMeter5;
	TOvcMeter *OvcMeter6;
	TOvcMeter *OvcMeter7;
	TOvcMeter *OvcMeter8;
	TOvcMeter *OvcMeter9;
	TOvcMeter *OvcMeter10;
	TOvcMeter *OvcMeter11;
	TOvcMeter *OvcMeter12;
	TOvcPeakMeter *OvcPeakMeter3;
	TOvcPeakMeter *OvcPeakMeter4;
	TTimer *Timer1;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall Timer1Timer(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
