library(fle+table)

df <- data.frame(timepoint = c("hPTMs", "cEBPa", "CTCF", "ATAC-seq","Hi-C"),
                 H000 = c(rep('+', 5)),
                 H003 = c(rep('+', 2), rep('-', 3)),
                 H006 = c(rep('+', 2), rep('-', 3)),
                 H009 = c(rep('+', 2), rep('-', 2), rep('+', 1)),
                 H012 = c(rep('+', 2), rep('-', 1), rep('+', 1), rep('-', 1)),
                 H018 = c(rep('+', 2), rep('-', 2), rep('+', 1)),
                 H024 = c(rep('+', 5)),
                 H036 = c(rep('+', 2), rep('-', 3)),
                 H048 = c(rep('+', 2), rep('-', 2), rep('+', 1)),
                 H072 = c(rep('+', 2), rep('-', 2), rep('+', 1)),
                 H096 = c(rep('-', 2), rep('+', 2), rep('-', 1)),
                 H120 = c(rep('+', 2), rep('-', 2), rep('+', 1)),
                 H168 = c(rep('+', 3), rep('-', 1), rep('+', 1)))

df <- as.data.frame(t(df))
colnames(df) <- df[1, ]
df <- df[-1, ]

df['time points'] <- rownames(df)

flextable(df[c(6, 1, 2, 3, 4, 5)]) %>% 
  add_header_row(top = TRUE, 
                 values = c("", 
                            "ChIP-seq", 
                            ""), 
                 colwidths = c(2, 2, 2)) %>% 
  add_footer_row(values = c("",
                            "Borsari et al. (2024)", 
                            "Stick et al. (2020)", 
                            "Choi et al. (2021)",
                            "Stick et al. (2020)"), 
                 colwidths = c(1, 2, 1, 1, 1)) %>% 
  save_as_pdf(path = "mytable.docx")
