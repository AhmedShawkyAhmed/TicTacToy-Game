from tkinter import *
from tkinter import ttk
from tkinter import messagebox

#Global Variables
ActivePlayer = 1
p1 = [] # what player 1 select
p2 = [] # what player 2 select

window = Tk()
window.title('Tic Tac Toy :Player 1')
style = ttk.Style()
style.theme_use('winnative')

#Add Buttons
Bu1=ttk.Button(window, text=' ')
Bu1.grid(row=0, column=0, sticky='snew', ipadx=30, ipady=40)
Bu1.config(command=lambda: ButtonClick(1))

Bu2=ttk.Button(window, text=' ')
Bu2.grid(row=0, column=1, sticky='snew', ipadx=30, ipady=40)
Bu2.config(command=lambda: ButtonClick(2))

Bu3=ttk.Button(window, text=' ')
Bu3.grid(row=0, column=2, sticky='snew', ipadx=30, ipady=40)
Bu3.config(command=lambda: ButtonClick(3))

Bu4=ttk.Button(window, text=' ')
Bu4.grid(row=1, column=0, sticky='snew', ipadx=30, ipady=40)
Bu4.config(command=lambda: ButtonClick(4))

Bu5=ttk.Button(window, text=' ')
Bu5.grid(row=1, column=1, sticky='snew', ipadx=30, ipady=40)
Bu5.config(command=lambda: ButtonClick(5))

Bu6=ttk.Button(window, text=' ')
Bu6.grid(row=1, column=2, sticky='snew', ipadx=30, ipady=40)
Bu6.config(command=lambda: ButtonClick(6))

Bu7=ttk.Button(window, text=' ')
Bu7.grid(row=2, column=0, sticky='snew', ipadx=30, ipady=40)
Bu7.config(command=lambda: ButtonClick(7))

Bu8=ttk.Button(window, text=' ')
Bu8.grid(row=2, column=1, sticky='snew', ipadx=30, ipady=40)
Bu8.config(command=lambda: ButtonClick(8))

Bu9=ttk.Button(window, text=' ')
Bu9.grid(row=2, column=2, sticky='snew', ipadx=30, ipady=40)
Bu9.config(command=lambda: ButtonClick(9))

def ButtonClick(id):
    global ActivePlayer

    if ActivePlayer == 1:
        SetLayout(id, "X")
        p1.append(id)
        window.title("Tic Tac Toy :Player 2")
        ActivePlayer = 2
        print("P1:{}".format(p1))
    elif ActivePlayer == 2:
        SetLayout(id, "O")
        p2.append(id)
        window.title("Tic Tac Toy :Player 1")
        ActivePlayer = 1
        print("P2:{}".format(p2))

    ChickWinner()

def SetLayout(ID, PlayerSymbol):

    if ID==1:
        Bu1.config(text=PlayerSymbol)
        Bu1.state(['disabled'])
    elif ID==2:
        Bu2.config(text=PlayerSymbol)
        Bu2.state(['disabled'])
    elif ID==3:
        Bu3.config(text=PlayerSymbol)
        Bu3.state(['disabled'])
    elif ID==4:
        Bu4.config(text=PlayerSymbol)
        Bu4.state(['disabled'])
    elif ID==5:
        Bu5.config(text=PlayerSymbol)
        Bu5.state(['disabled'])
    elif ID==6:
        Bu6.config(text=PlayerSymbol)
        Bu6.state(['disabled'])
    elif ID==7:
        Bu7.config(text=PlayerSymbol)
        Bu7.state(['disabled'])
    elif ID==8:
        Bu8.config(text=PlayerSymbol)
        Bu8.state(['disabled'])
    elif ID==9:
        Bu9.config(text=PlayerSymbol)
        Bu9.state(['disabled'])

def ChickWinner():
    winner = -1

    # in Rows
    if (1 in p1) and (2 in p1) and (3 in p1):
        winner = 1
    elif (1 in p2) and (2 in p2) and (3 in p2):
        winner = 2
    elif (4 in p1) and (5 in p1) and (6 in p1):
        winner = 1
    elif (4 in p2) and (5 in p2) and (6 in p2):
        winner = 2
    elif (7 in p1) and (8 in p1) and (9 in p1):
        winner = 1
    elif (7 in p2) and (8 in p2) and (9 in p2):
        winner = 2

    # in Columns
    elif (1 in p1) and (4 in p1) and (7 in p1):
        winner = 1
    elif (1 in p2) and (4 in p2) and (7 in p2):
        winner = 2
    elif (2 in p1) and (5 in p1) and (8 in p1):
        winner = 1
    elif (2 in p2) and (5 in p2) and (8 in p2):
        winner = 2
    elif (3 in p1) and (6 in p1) and (9 in p1):
        winner = 1
    elif (3 in p2) and (6 in p2) and (9 in p2):
        winner = 2

    # in Cross
    elif (1 in p1) and (5 in p1) and (9 in p1):
        winner = 1
    elif (1 in p2) and (5 in p2) and (9 in p2):
        winner = 2
    elif (3 in p1) and (5 in p1) and (7 in p1):
        winner = 1
    elif (3 in p2) and (5 in p2) and (7 in p2):
        winner = 2

    # in Draw
    elif (((1 in p1) or (1 in p2)) and ((2 in p1) or (2 in p2)) and ((3 in p1) or (3 in p2))
            and ((4 in p1) or (4 in p2)) and ((5 in p1) or (5 in p2)) and ((6 in p1) or (6 in p2))
            and ((7 in p1) or (7 in p2)) and ((8 in p1) or (8 in p2)) and ((9 in p1) or (9 in p2))):
        winner = 3

    # Messages
    if winner == 1:
        messagebox.showinfo(title='Game Over.', message='Player 1 is the Winner!')
        disable()
    elif winner == 2:
        messagebox.showinfo(title='Game Over.', message='Player 2 is the Winner!')
        disable()
    elif winner == 3:
        messagebox.showinfo(title='Game Over.', message="No Winner, it's a Draw")

def disable():
    Bu1.state(['disabled'])
    Bu2.state(['disabled'])
    Bu3.state(['disabled'])
    Bu4.state(['disabled'])
    Bu5.state(['disabled'])
    Bu6.state(['disabled'])
    Bu7.state(['disabled'])
    Bu8.state(['disabled'])
    Bu9.state(['disabled'])

window.mainloop()