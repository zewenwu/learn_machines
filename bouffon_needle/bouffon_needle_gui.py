
import random, math, os.path
import PySimpleGUI as sg

import numpy as np
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg

import matplotlib
from matplotlib import pyplot as plt

# fig = matplotlib.figure.Figure(figsize=(5, 4), dpi=100)
fig = plt.figure()
fig.add_subplot(111)
t = np.arange(-2, 2, .01)
plt.plot(t, 0*np.sin(2 * np.pi * t))
# plt.axis('off')
plt.axis('equal')
plt.xlim(-2, 2)
plt.ylim(-3, 3)

# matplotlib.use("TkAgg")

def draw_needle(x, y, theta):
    r = np.arange(x-np.cos(theta), x+np.cos(theta), .01)
    plt.plot(r, np.tan(theta)*r + y)

# Bouffon's experiment function
def bouffon_needle(N):
    total_intersected = 0

    # Throw the N needles
    for i in range(0, N):
        theta = random.uniform(0, math.pi/2)
        y = random.uniform(0, 1)
        x = random.uniform(-1, 1)

        draw_needle(x, y, theta)

        needle_intersected = (y < math.sin(theta)/2)
        if (needle_intersected):
            total_intersected += 1

    # Getting the results
    pi_estimate = N/total_intersected
    return pi_estimate

def draw_figure(canvas, figure):
    figure_canvas_agg = FigureCanvasTkAgg(figure, canvas)
    figure_canvas_agg.draw()
    figure_canvas_agg.get_tk_widget().pack(side="top", fill="both", expand=1)
    return figure_canvas_agg

# GUI
# First the window layout in 2 columns

parameters_column = [
    [sg.Text('Enter the number of needles: '), 
        sg.Slider(range=(100,1000),
         default_value=500,
         size=(20,15),
         orientation='horizontal',
         font=('Helvetica', 12))],
    [sg.Button('Throw the needles', key="-RUN-"), sg.Button('Reset')],

    [sg.Text('_'*50)],

    [sg.Text("Bouffon's estimation of pi: "), sg.Text(0)],
    [sg.Text("Value of pi:"), sg.Text(math.pi)],
]

# For now will only show the name of the file that was chosen
experiment_column = [
    [sg.Canvas(key="-CANVAS-", size=(40, 20))],
]

# ----- Full layout -----
layout = [
    [
        sg.Column(parameters_column),
        sg.VSeperator(),
        sg.Column(experiment_column),
    ]
]

window = sg.Window("Bouffon's Needle Experiment", layout)
# draw_figure(window["-CANVAS-"].TKCanvas, fig)


# Run the Event Loop
while True:
    event, values = window.read()

    if event == sg.WIN_CLOSED:
        break
    elif event == "-RUN-":
        
        pi_estimate = bouffon_needle(5)
        draw_figure(window["-CANVAS-"].TKCanvas, fig)

window.close()

## Sources:
# https://realpython.com/python-gui-with-wxpython/#:~:text=There%20are%20many%20graphical%20user,capability%20of%20working%20on%20mobile.