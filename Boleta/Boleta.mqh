//+------------------------------------------------------------------+
//|                                                       Boleta.mqh |
//|                                    Copyright 2022, Valmir França |
//|                            https://www.mql5.com/pt/users/vfranca |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, Valmir França"
#property link      "https://www.mql5.com/pt/users/vfranca"
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2010
//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);
// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import
//+------------------------------------------------------------------+
//| EX5 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex5"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+
void Comprar()
  {
//---
   PlaySound("ok.wav");
//---
   double MagicNumber =TimeCurrent();
   GlobalVariableSet("MagicNumber_Glb",NormalizeDouble(MagicNumber,0));
//---
   trade.SetExpertMagicNumber(MagicNumber);
//---
   double lastPrice = 0.0;
//SymbolInfoDouble(Symbol(),SYMBOL_LAST,lastPrice);
   lastPrice =  NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_LAST),_Digits);
   double Last_Ask   = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Last_Bid    = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
//--- SL e TP em pontos
   double sl = GlobalVariableGet("vStop_Glb");
   double tp = GlobalVariableGet("vTkProft_Glb");
//--- Ordem de compra a mercado com SL e TP
   GlobalVariableSet("Edt_Tx_02_Vol_Buy_Glb", InpVolume);
   trade.Buy(GlobalVariableGet("Edt_Tx_02_Vol_Buy_Glb"), Symbol(), 0, Last_Ask - sl, Last_Ask + tp);

  }
//+------------------------------------------------------------------+
void Vender()
  {
//---
   PlaySound("ok.wav");
//---
   double MagicNumber =TimeCurrent();
   GlobalVariableSet("MagicNumber_Glb",NormalizeDouble(MagicNumber,0));
//---
   trade.SetExpertMagicNumber(MagicNumber);
//---
   double Last_Ask   = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double   Last_Bid   = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   double lastPrice = 0.0;
   SymbolInfoDouble(Symbol(),SYMBOL_LAST,lastPrice);
//--- SL e TP em pontos
   double sl = GlobalVariableGet("vStop_Glb");
   double tp = GlobalVariableGet("vTkProft_Glb");
//---
   GlobalVariableSet("Edt_Tx_02_Vol_Sell_Glb", InpVolume);
   trade.Sell(GlobalVariableGet("Edt_Tx_02_Vol_Sell_Glb"), Symbol(), 0, Last_Bid + sl, Last_Bid - tp);
  }
//+------------------------------------------------------------------+
void CancelarOrdensPendentes()
  {
//---
   PlaySound("ok.wav");
//---
   ulong orderTicket = 0;
   int try
         =100;
   while(OrdersTotal() != 0 && try
            -- > 0)
        {
         orderTicket = OrderGetTicket(0) ;
         trade.OrderDelete(orderTicket) ;
        }
  }
//+------------------------------------------------------------------+
void FecharParcial()
  {
//--- Zera 1 por vez
   PlaySound("ok.wav");
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong ticket =   PositionGetTicket(i) ;
      double     pos_volume     =PositionGetDouble(POSITION_VOLUME);
      //---
      if(pos_volume > 0)
        {
         trade.PositionClose(ticket) ;
         i=0;
         break;
        }
     }
  }
//+------------------------------------------------------------------+
void ZerarTudo()
  {
//---
   PlaySound("ok.wav");
//---
// Comment(PositionsTotal());
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      int ticket =   PositionGetTicket(i) ;
      trade.PositionClose(ticket) ;
     }
//---
   ulong orderTicket = 0;
   int try
         = 100;
   while(OrdersTotal() != 0 && try
            -- > 0)
        {
         orderTicket = OrderGetTicket(0) ;
         trade.OrderDelete(orderTicket) ;
        }
  }
//+------------------------------------------------------------------+
void ChecarPosicoesAbertas()
  {
//---
   PlaySound("ok.wav");
//---
   for(int i = PositionsTotal()-1; i>=0; i--)
     {
      string symbol = PositionGetSymbol(i);
      ulong magic = PositionGetInteger(POSITION_MAGIC);
      if(symbol == _Symbol)
        {
         PlaySound("timeout.wav");
         break;
        }
     }
//---
   for(int i = OrdersTotal()-1; i>=0; i--)
     {
      ulong ticket = OrderGetTicket(i);
      string symbol = OrderGetString(ORDER_SYMBOL);
      ulong magic = OrderGetInteger(ORDER_MAGIC);
      if(symbol == _Symbol)
        {
         PlaySound("timeout.wav");
         break;
        }
     }
  }
//+------------------------------------------------------------------+
void FecharNoLucro()
  {
//--- Close positions Profit > 0
   PlaySound("ok.wav");
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong ticket =   PositionGetTicket(i) ;
      double    pos_profit     =PositionGetDouble(POSITION_PROFIT);
      if(pos_profit > 0)
        {
         trade.PositionClose(ticket) ;
        }
     }
  }
//+------------------------------------------------------------------+
