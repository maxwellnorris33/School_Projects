import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import yfinance as yf
import plotly.graph_objs as go

class stonks:
    """
    Stonk is a commonly used work on the internet for 'stock'
    """

    def __init__(self, Name):
        self.name = Name.upper() #name of stock (stock's symbol)
        self.handle = yf.Ticker(Name) #handle to access the yfinance methods to get stock data
        self.stonk_dataframe = None #setting to type none to be changed when futue functions are called
        self.current_price = None #setting to type none to be changed when futue functions are called
        self.current_data = None

    def historical_data(self, period='2y'):
        """
        given a period specifid by user from the options creates a dataframe for that period.
        options are: 1d, 5d, 1mo, 3mo, 6mo, 1y, 2y, 5y, 10y
        default value however is 2y and that is what we will be using in our implementation of this class
        """
        self.stonk_dataframe = self.handle.history(period = period) #getting historical data

    def stonk_price(self):
        """
        gets current data for specific stock
        """
        self.current_data = yf.download(tickers=self.name, period='1d', interval='1m') #getting data for most recent weekday that markets were open
        self.current_price = self.current_data['Close'].iloc[-1] #getting most recent price

    def graph_live_stonk(self):
        """
        graphs the live market data of a stock
        """
        #Graph Current Data
        fig1 = go.Figure()

        #Candlestick
        fig1.add_trace(go.Candlestick(x=self.current_data.index, open=self.current_data.Open, high=self.current_data.High, low=self.current_data.Low, close=self.current_data.Close, name= 'market data'))

        #Add titles
        fig1.update_layout(title=self.name+ ' live share price evolution', yaxis_title='Stock Price (USD per Shares)')

        #X-Axes
        fig1.update_xaxes(\
            rangeslider_visible=True, rangeselector=dict(\
                buttons=list([\
                    dict(count=5, label='5m', step='minute', stepmode='backward'), \
                    dict(count=30, label='30m', step='minute', stepmode='backward'), \
                    dict(count=1, label='1h', step='hour', stepmode='backward'), \
                    dict(count=3, label='3h', step='hour', stepmode='backward'), \
                    dict(step='all') ] )))

        #Show
        fig1.show()

    def graph_historical_stonk(self):
        """
        graphs the historical market data of a stock
        """
        #Graph Historical Data
        fig2 = go.Figure()

        #Candlestick
        fig2.add_trace(go.Candlestick(x=self.stonk_dataframe.index, open=self.stonk_dataframe.Open, high=self.stonk_dataframe.High, low=self.stonk_dataframe.Low, close=self.stonk_dataframe.Close, name= 'historical market data'))

        #Add titles
        fig2.update_layout(title=self.name+ ' Historical Stock data', yaxis_title='Stock Price (USD per Shares)')

        #X-Axes
        fig2.update_xaxes(\
            rangeslider_visible=True, rangeselector=dict(\
                buttons=list([\
                    dict(count=1, label='day', step='day', stepmode='backward'), \
                    dict(count=7, label='week', step='day', stepmode='backward'), \
                    dict(count=1, label='month', step='month', stepmode='backward'), \
                    dict(count=1, label='year', step='year', stepmode='backward'), \
                    dict(step='all') ] )))

        #Show
        fig2.show()

    def __repr__(self):
        return str(self.name)+' is the current stonk valued at '+str(round(self.current_price, 2)) + ' USD'

def user_interface():
    '''
    uses the stonks class defined above to provide an interactive experience for the user where they are able to pick the stock
    and get up to date information as well as historical data.
    inputs/outputs: none
    '''
    stat1= True
    while stat1: #allows user to pick stock of their choice using exception handeling 
        try:
            UI = input("Please enter the letter code of a stock of your choosing, should be on US stock markets; ie Apple = AAPL: ")
            UI.upper()
            stock = stonks(UI)
            stat1 = False
        except:
            print("The code you entered was invalid or not found. Please enter code correctly or try a different stock.")
    
    status = True
    while status:
        try: 
            option = int(input("Enter 1 for current stock price. \nEnter 2 for current stock price graph. \nEnter 3 for historical stock price graph.\
            \nEnter 4 to change stock. \nEnter 5 to quit program."))
        except:
            print('invalid input.')
            option = 0

        #checks to see what the user inputed, and responds accordingly
        if option == 1: 
            stock.stonk_price() #updates current price prior to printing
            print(stock)
        elif option == 2:
            stock.stonk_price() #updates current days data for graph
            stock.graph_live_stonk()
        elif option == 3:
            stock.historical_data() #updates historical data
            stock.graph_historical_stonk()
        elif option == 4: #does same thing as start of prgram to allow user to pick stock
            stat1= True
            while stat1:
                try:
                    UI = input("Please enter the letter code of a stock of your choosing, should be on US stock markets; ie Apple = AAPL: ")
                    UI.upper()
                    stock = stonks(UI)
                    stat1 = False
                except:
                    print("The code you entered was invalid or not found. Please enter code correctly or try a different stock.")
            stock.stonk_price()
            stock.historical_data()
        elif option == 5:
            status = False
        else:
            print('invalid input.')