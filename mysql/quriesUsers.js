module.exports = {
  addNewUsers: (email) => {
    return `INSERT INTO users (email) 
                    VALUE ("${email}")`;
  },
};
