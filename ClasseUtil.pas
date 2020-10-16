unit ClasseUtil;

interface

uses Vcl.DBGrids,Vcl.Controls, Vcl.Forms, FireDAC.Comp.Client,
Vcl.Dialogs,System.SysUtils, System.Variants, System.Classes, Vcl.Graphics;

type
  TClasseUtility = class
  public
    procedure GridTitulo(Column: TColumn; DBGrid: TDBGrid);
  end;

implementation

{ TClasseUtil }

procedure TClasseUtility.GridTitulo(Column: TColumn; DBGrid: TDBGrid);
var
  I: Integer;
begin
if( DBGrid.DataSource.DataSet.IsEmpty) then

else
 Begin
    With DBGrid do
  Begin
    // Retira o destaque de todas as colunas
    for I := 0 to Columns.Count - 1 do
      Columns[I].Title.Font.Style := Columns[I].Title.Font.Style - [fsBold, fsUnderline];
    // Destaca a coluna clicada
    Columns[Column.Index].Title.Font.Style := Columns[Column.Index].Title.Font.Style +
      [fsBold, fsUnderline];
  End;

  if(TFDQuery(DBGrid.DataSource.DataSet).RecordCount >0)then
  begin
    if TFDQuery(DBGrid.DataSource.DataSet).IndexFieldNames = Column.FieldName + ':D' then
        TFDQuery(DBGrid.DataSource.DataSet).IndexFieldNames := Column.FieldName + ':A'
    else
      TFDQuery(DBGrid.DataSource.DataSet).IndexFieldNames := Column.FieldName + ':D'
  end;
 End;
end;

end.
