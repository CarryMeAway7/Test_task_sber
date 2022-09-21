class regress:

    def __init__(self, new_x):
        x = [0, 2, 4, 9, 3]
        y = [1, 2, 3, 8, 5]
        sqrleft = []

        x.append(new_x)
        for i in range(6):
            self.predicted_y = 0.0008 * x[i] ** 2 + 0.7574 * x[i] + 1.0548
            self.left = x[i] - self.predicted_y
            sqrleft.append(self.left ** 2)
            self.sumsqrleft = sum(sqrleft)
        y.append(self.predicted_y)

        print("RMSE=", self.sumsqrleft / 5 ** (0.5))
        print("predicted Y=", self.predicted_y)
        print("x=", x)
        print("y=", y)
        print("")

######################################################
# /Задание 1/

# j = 0
# print("для выхода нажмите любой символ (не цифру)")
# while j != 1:
#     new_x = input("Введите x: ")
#     if new_x.isdigit():
#         new_x = int(new_x)
#         regress(new_x)
#     else:
#         print("exit")
#         exit()

######################################################
class simply:

    def __init__(self, j):
        self.j = j

    def __bool__(self):
        return self.j == 0


def prime():
    a = int(input("Введите число: "))
    if a > 1:
        k = 0
        for i in range(2, a // 2 + 1):
            if a % i == 0:
                k = k + 1

        number = simply(k)
        simple_number = bool(number)
        if simple_number is True:
            a = a - 2
            g = 0
            for i in range(2, a // 2 + 1):
                if a % i == 0:
                    g = g + 1
            number = simply(g)
            simple_number = bool(number)

            if simple_number is True:
                print(bool(number))
            else:
                a = a + 4
                j = 0
                for i in range(2, a // 2 + 1):
                    if a % i == 0:
                        j = j + 1
                number = simply(j)
                simple_number = bool(number)

                if simple_number is True:
                    number = simply(j)
                    print(bool(number))
                else:
                    print(bool(number))
        else:
            print(bool(number))
    else:
        number = simply(a)
        print(bool(number))

######################################################
# /Задание 2/

# prime()

######################################################
def create_counter():

    def get_next_partition(partition):
        nonlocal count
        count = count + 1

        if len(partition) == 1:
            print("Количество разделов = ", count)

        else:
            min_index = 0
            for i in range(0, len(partition)-1):
                if partition[i] < partition[min_index]:
                    min_index = i

            partition[min_index] += 1
            partition[-1] -= 1
            part_sum = sum(partition[min_index+1::])
            return partition[0:min_index+1:]+[1 for i in range(part_sum)]

    def print_all_number_partition(number):
        partition = [1 for i in range(number)]
        while partition is not None:
            # print(partition)
            partition = get_next_partition(partition)

    count = 0
    number = int(input("Введите число: "))
    print_all_number_partition(number)
######################################################
# /Задание 3/

create_counter()
######################################################
