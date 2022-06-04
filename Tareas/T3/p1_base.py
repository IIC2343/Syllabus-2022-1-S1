import numpy as np
import time

# ----------
# el siguiente codigo mueve una ventana de tamaño window_size a traves de una
# imagen de tamaño image_size, luego transforma cada ventana en una lista de
# filas y luego calcula el promedio de cada fila
# ----------
# deberán paralelizar este código utilizando Numba y mostrar la diferencia
# de tiempo entre el código original y el paralelizado
# para esto es recomendable que utilicen un input más o menos grande
# como se muestra en el ejemplo en el notebook jupyter
# ----------


def sliding_window(image, window_size, step_size):
    for y in range(0, image.shape[0], step_size[1]):
        for x in range(0, image.shape[1], step_size[0]):
            yield (x, y, image[y:y + window_size[1], x:x + window_size[0]])


def im2rows(image, v_windows, h_windows):  # pasar cada ventana en la imagen a una fila
    rows = []
    for win in sliding_window(image, window_size=(v_windows, h_windows), step_size=(1, 1)):
        rows.append(win[2])
    return rows


def row_averages(rows):  # promedio de cada fila
    row_averages = []
    for row in rows:
        row_averages.append(row.mean())
    return row_averages


def slow(img):
    rows = im2rows(img, v_windows=1, h_windows=1)
    averages = row_averages(rows)
    return averages


if __name__ == "__main__":
    start = time.time()
    out1 = slow(np.arange(1000000).reshape(1000, 1000))
    end = time.time()
    print("Tiempo de ejecucion sin numba: ", end - start)
