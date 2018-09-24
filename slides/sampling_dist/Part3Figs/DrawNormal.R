## First, draw the Normal curve:
xval <- seq(200,350,1) # What range do you want for x?
norm.val <- dnorm(xval,266,16) # Use R to find the density values for the range of x 
					# that you want to look at – in this example, with mean 1 and SD 1.2
plot(xval,norm.val,type="l") # Plot the line (you will probably want to re-label the axes & add a title

# Now draw a filled polygon to
# “colour in” part of the area under the curve:

poly.x <- c(seq(-5,0,.1),0,-5) # What x-values? Create a sequence from a very small number (e.g., the minimum
					 # of “xval” from above, all the way up to the threshold that you are interested in. THEN
					 # add to this a zero (0) and the minimum of “xval” [we want a closed polygon].
poly.y <- c(dnorm(seq(-5,0,.1),1,1.2),0,0)
					 # We now need to create the corresponding heights. We do this by finding the normal 
					 # values that correspond to the values in “poly.x” and THEN add *two* zeros.
polygon(poly.x,poly.y,col=4) 


### Gestation Question 
xval <- seq(200,350,.1) 
norm.val <- dnorm(xval,266,16) 
plot(xval,norm.val,type="l",ylab="density",xlab="days") 
abline(v=266)
text(273,0.01,quote(mu==266))
abline(v=266+16,lty=2)
text(287,0.007,quote(mu+sigma))
abline(v=266-16,lty=2)
text(255,0.007,quote(mu-sigma))

### Question 1.92a
xval <- seq(-4,4,.05) 
norm.val <- dnorm(xval,0,1) 
plot(xval,norm.val,type="l",ylab="density",xlab="x") 
poly.x <- c(seq(-4,1.85,.05),1.85,-4)
poly.y <- c(dnorm(seq(-4,1.85,.05)),0,0)
polygon(poly.x,poly.y,col=4) 


