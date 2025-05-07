import { db } from "../db/database.mjs";

// 회원가입 사용자 추가 userid, password, name, email, url
export async function createUser(user) {
  const { userid, password, name, email, url } = user;
  return db
    .execute(
      "insert into userss (userid, password, name, email, url) values (?, ?, ?, ?, ?)",
      [userid, password, name, email, url]
    )
    .then((result) => result[0].insertId);
}

// 로그인
export async function login(userid, password) {
  const [rows] = await db.execute(
    "SELECT * FROM userss WHERE userid = ? AND password = ?",
    [userid, password]
  );
  return rows[0];
}

export async function findByUserid(userid) {
  return db
    .execute("select * from userss where userid=?", [userid])
    .then((result) => result[0][0]);
}

export async function findByid(idx) {
  return db
    .execute("select * from userss where idx=?", [idx])
    .then((result) => result[0][0]);
}
