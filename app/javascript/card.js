const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault(); //通常のRuby on Railsにおけるフォーム送信処理をキャンセル →サーバーサイドへリクエストは送られない

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {      //フォームからカード情報を取得
      number: formData.get("purchase_delivery[card_number]"),
      cvc: formData.get("purchase_delivery[cvc]"),
      exp_month: formData.get("purchase_delivery[month]"),
      exp_year: `20${formData.get("purchase_delivery[year]")}`, 
    };

    //カード情報送信が成功したら、トークンをゲットして、購入フォームにこっそり埋め込み、トークンを送信する。
    Payjp.createToken(card, (status, response) => {  //(status, response)=>{}には、PAY.JP側からトークンが送付された後に実行する処理を記述
      if (status == 200) { //200はリクエスト(カード情報の送信)が成功したときのステータス
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;  //テンプレートリテラルを使うとHTMLの要素を作成できる
        //insertAdjacentHTMLメソッドとは、HTMLをある要素の指定した箇所に挿入するメソッド.
        //使い方： <挿入したい要素名>.insertAdjacentHTML(挿入したい位置,挿入したいHTML);
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      //フォームのカード情報はもういらないので消去↓
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit(); //クレカ情報消去後、残ったフォームの情報をサーバーサイドに送信
    });
  });
};

window.addEventListener("load", pay);