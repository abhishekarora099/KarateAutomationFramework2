function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    username: 'abhishek',
    password: 'arora'
  }
  if (env == 'dev') {
    config.username= 'author';
config.password= 'authorpassword';
  } else if (env == 'e2e') {
   config.username= 'user';
config.password= 'userpassword';
  }

else if (env == 'staging') {
   config.username= 'stagingadmin1';
config.password= 'stagingwelcome';
  }
else if (env == 'prod') {
   config.username= 'prodadmin1';
config.password= 'prodwelcome';
  }






  return config;
}