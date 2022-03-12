# What is the average age of those who use each web browser type?
airbnb_test_users1 <- aggregate(age~first_browser, airbnb_test_users, mean)

# What is the total signup_flow for each device?
airbnb_test_users2 <- aggregate(signup_flow~first_device_type, airbnb_test_users, sum)

# They need the country information from this dataset included in the airbnb_test_users file.
airbnb_test_users3 <- merge(airbnb_test_users, airbnb_sample_submission, by=c("id"))

# Add additional users to the test file 
airbnb_test_users4 <- merge(airbnb_test_users3, Temp1_airbnb_users, by=c("id"), all=TRUE)

