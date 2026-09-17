data <- readxl::read_excel("data/data_excel.xlsx", sheet = "data")


openxlsx::write.xlsx(data, "out/data_excel.xlsx", colNames = TRUE)

library(tidyverse)
data <- read_rds("data/data_rds.rds")

write_rds(data, "out/data_rds.rds")
data$`Группа крови`

data[["Группа крови"]] # то же самое, другой синтаксис

tibble(
  var_first = 1:10,
  var_second = var_first^2
)

tibble(
  var_first = 1:10,
  var_second = if_else(var_first < 5, var_first + 100, var_first)
)
tibble(var_first = 1:10, var_first = ifelse(var_first < 5, var_first + 100, var_first))
tibble(var_1 = c(1:10) - 100, var_2 = 1:100)
tibble(var = 1:10, var = var - 10000000)

data |>
  add_column(just_column = "just values", .before = 1)

data |>
  add_row(Группа = "New group", Возраст = 100, .before = 1)

data |>
  mutate(ID = row_number())
data

data |> select(`Группа крови`, `Возраст`, function(x) anyNA(x))
data |> select(where(function(x) is.factor(x) & any(str_detect(x, "Жен"), na.rm = TRUE)))

data |> select(`Группа`, function(x) !is.factor(x))

data |> select(function(x) sd(x, na.rm = TRUE) > 1)

data |> select(`Пол`, `Группа`, `Базофилы_E1`)
data |> select(`Группа`, (function(x) is.factor(x)) | where(function(x) is.numeric(x)))

data |> select(where(is.numeric) & where(function(x) sd(x, na.rm = TRUE) > 1))
data |> select(Группа крови, `Возраст`, function(x) anyNA(x))