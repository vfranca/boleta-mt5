//+------------------------------------------------------------------+
//|                                                       Boleta.mq5 |
//|                                    Copyright 2022, Valmir França |
//|                            https://www.mql5.com/pt/users/vfranca |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, Valmir França"
#property link      "https://www.mql5.com/pt/users/vfranca"
#property version   "1.00"
//+------------------------------------------------------------------+
input double InpVolume=0.00; // Volume
input double InpStopLoss=0.00; // Stop loss
input double InpTakeProfit=0.00; // Take profit
//+------------------------------------------------------------------+
#include <Boleta.mqh>
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---

  }
//+------------------------------------------------------------------+
