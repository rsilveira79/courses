## Constants
n_samples <- 10000

## Initial Vectors
e_x <- rnorm(n_samples)
e_y <- rnorm(n_samples)
e_z <- rnorm(n_samples)


## Nodes for the DAG
intervention <- 1
z <- 1*(e_z >0)
x <- 1*(z + e_x >0.5)
y <- 1*(x + z + e_y >2)
y_dox <- 1*(intervention + z + e_y >2)


## Plot KDEs
d_x <- density(x)
plot(d_x)
polygon(d_x, col='blue', border = "blue")

d_z <- density(z)
plot(d_z)
polygon(d_z, col='cyan', border = "cyan")

d_y <- density(y)
plot(d_y)
polygon(d_y, col='yellow', border = "yellow")

d_y_dox <- density(y_dox)
plot(d_y_dox)
polygon(d_y_dox, col='gray', border = "gray")

## Mean of interventions
mean(z)
mean(x)
mean(y)
mean(y_dox)
mean(y[x==1])
