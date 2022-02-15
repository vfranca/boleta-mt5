//+------------------------------------------------------------------+
//|                                                       Boleta.mq5 |
//|                                    Copyright 2022, Valmir França |
//|                            https://www.mql5.com/pt/users/vfranca |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, Valmir França"
#property link      "https://www.mql5.com/pt/users/vfranca"
#property version   "1.00"
//+------------------------------------------------------------------+
enum teclas
  {
   C=46,
   V=47,
   O=24,
   P=25,
   Z=44,
   K=37,
   G=34
  };
//+------------------------------------------------------------------+
input double InpVolume=0.00; // Volume
input double InpStopLoss=0.00; // Stop loss
input double InpTakeProfit=0.00; // Take profit
input teclas InpTeclaComprar=46; // Tecla comprar a mercado
input teclas InpTeclaVender=47; // Tecla vender a mercado
input teclas InpTeclaPendentes=24; // Tecla cancelar órdens pendentes
input teclas InpTeclaParcial=25; // Tecla fechar parcial
input teclas InpTeclaLucro=34; // Tecla fechar no lucro
input teclas InpTeclaZerar=44; // Tecla zerar tudo
input teclas InpTeclaChecar=37; // Tecla checar posições abertas
//+------------------------------------------------------------------+
#include "Boleta.mqh"
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>
CTrade trade;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   GlobalVariableSet("vStop_Glb",InpStopLoss);
   GlobalVariableSet("vTkProft_Glb",InpTakeProfit);
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
   switch(id)
     {
      case CHARTEVENT_KEYDOWN:
        {
         if(sparam==InpTeclaComprar)
           {
            //--- Comprar a mercado
            Comprar();
           }
         if(sparam==InpTeclaVender)
           {
            //--- Vender a mercado
            Vender();
           }
         if(sparam==InpTeclaPendentes)
           {
            //--- Cancelar Órdens pendentes
            CancelarOrdensPendentes();
           }
         if(sparam==InpTeclaParcial)
           {
            //--- Fechar parcial
            FecharParcial();
           }
         if(sparam==InpTeclaLucro)
           {
            //--- Fechar no lucro
            FecharNoLucro();
           }
         if(sparam==InpTeclaZerar)
           {
            //--- Zera tudo
            ZerarTudo();
           }
         if(sparam==InpTeclaChecar)
           {
            //--- Checa órdens e posições abertas
            ChecarPosicoesAbertas();
           }
         break;
        } // endcase
     } // endswitch

  }
//+------------------------------------------------------------------+
