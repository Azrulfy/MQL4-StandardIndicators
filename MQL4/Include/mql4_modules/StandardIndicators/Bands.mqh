//+------------------------------------------------------------------+
//|                                                        Bands.mqh |
//|                                 Copyright 2017, Keisuke Iwabuchi |
//|                                         https://order-button.com |
//+------------------------------------------------------------------+


#ifndef _LOAD_MODULE_BANDS
#define _LOAD_MODULE_BANDS


#include <mql4_modules\StandardIndicators\IndicatorsBase.mqh>


/** Bollinger Bands® */
class Bands : public IndicatorsBase
{
   public:
      int    period;
      double deviation;
      int    bands_shift;
      int    applied_price;
      int    mode;
      
      Bands(void);
      double Value(const int shift);
};


/** constructor. */
Bands::Bands(void)
{
   this.symbol        = __Symbol;
   this.timeframe     = 0;
   this.period        = 20;
   this.deviation     = 2.0;
   this.bands_shift   = 0;
   this.applied_price = PRICE_CLOSE;
   this.mode          = MODE_MAIN;
}


/**
 * Calculates the Bollinger Bands®.
 *
 * @pram const int shift  Shift relative to the current bar.
 *
 * @return double  Returns Bolinger Bands® value.
 */
double Bands::Value(const int shift)
{
   return(iBands(this.symbol,
                 this.timeframe,
                 this.period,
                 this.deviation,
                 this.bands_shift,
                 this.applied_price,
                 this.mode,
                 shift
                 )
          );
}


#endif
