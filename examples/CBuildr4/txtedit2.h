//---------------------------------------------------------------------------
#ifndef TxtEdit2H
#define TxtEdit2H
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\Buttons.hpp>
//---------------------------------------------------------------------------
class TEditAbout : public TForm
{
__published:	// IDE-managed Components
  TLabel *Label1;
  TLabel *Label2;
  TLabel *Label3;
  TLabel *Label4;
  TLabel *Label5;
    TButton *Button1;
    void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TEditAbout(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TEditAbout *EditAbout;
//---------------------------------------------------------------------------
#endif
