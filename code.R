library(readxl)
library(tidyverse)

y2023 <- read_excel("Edited-Rekapitulasi data publikasi.xlsx",
                         sheet = "2023",
                         skip = 1)
y2024 <- read_excel("Edited-Rekapitulasi data publikasi.xlsx",
                         sheet = "2024",
                         skip = 1)
y2025 <- read_excel("Edited-Rekapitulasi data publikasi.xlsx",
                    sheet = "2025",
                    skip = 1) |> 
  filter(Status == "DITERIMA")
y2026 <- read_excel("Edited-Rekapitulasi data publikasi.xlsx",
                    sheet = "2026",
                    skip = 1) |> 
  filter(Status == "DITERIMA")
y2023 |> count(Status)
y2024 |> count(Status)
y2025 |> count(Status)
y2026 |> count(Status)


# Tabel 1-II.2 Luaran Penelitian DPR dalam bentuk publikasi artikel dalam 3 tahun saat TS (Indikator 18C)
## TS - 2
s2023_2024_1 <- y2023 |> 
  filter(str_detect(Bulan, "(0[9]|1[012])"))
s2023_2024_2 <- y2024 |> 
  filter(str_detect(Bulan, "(0[1-8])"))
s2023_2024_all <- s2023_2024_1 |> 
  select(`Tipe Publikasi`) |> 
  bind_rows(s2023_2024_2 |> 
              select(`Tipe Publikasi`)) |> 
  mutate(type_combined = `Tipe Publikasi`,
         type_combined = if_else(str_detect(type_combined, "Nasional Terakreditasi"), "Nasional Terakreditasi", type_combined))
s2023_2024_all |> count(type_combined)

## TS - 1
s2024_2025_1 <- y2024 |> 
  filter(str_detect(Bulan, "(0[9]|1[012])"))
s2024_2025_2 <- y2025 |> 
  filter(str_detect(Bulan, "(0[1-8])"))
s2024_2025_all <- s2024_2025_1 |> 
  select(`Tipe Publikasi`) |> 
  bind_rows(s2024_2025_2 |> 
              select(`Tipe Publikasi`)) |> 
  mutate(type_combined = `Tipe Publikasi`,
         type_combined = if_else(str_detect(type_combined, "Nasional Terakreditasi"), "Nasional Terakreditasi", type_combined))
s2024_2025_all |> count(type_combined)

## TS
s2025_2026_1 <- y2025 |> 
  filter(str_detect(Bulan, "(0[9]|1[012])"))
s2025_2026_2 <- y2026 |> 
  filter(str_detect(Bulan, "(0[1-8])"))
s2025_2026_all <- s2025_2026_1 |> 
  select(`Tipe Publikasi`) |> 
  bind_rows(s2025_2026_2 |> 
              select(`Tipe Publikasi`)) |> 
  mutate(type_combined = `Tipe Publikasi`,
         type_combined = if_else(str_detect(type_combined, "Nasional Terakreditasi"), "Nasional Terakreditasi", type_combined))
s2025_2026_all |> count(type_combined)
