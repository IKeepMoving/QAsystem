package com.rance.chatui.ui.activity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.rance.chatui.R;

public class LoginActivity extends AppCompatActivity {
    private Button button;
    private TextView ed1;
    private TextView ed2;
    private String pw;
    private  String user;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
          button= (Button) findViewById(R.id.subBtn);
        ed1= (EditText) findViewById(R.id.pwdEt);
        ed2=(EditText) findViewById(R.id.accountEt);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                    user=ed2.getText().toString();
                    pw=ed1.getText().toString();
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        //在主线程中运行
                        startMainActivity();
                    }
                }, 1000);
            }
        });
    }

    private void startMainActivity() {
        if(pw.equals("a")&&user.equals("admin"))
        {
            Intent intent=new Intent(this,MainActivity.class);
            startActivity(intent);
            finish();

        }
        else{
            Toast.makeText(LoginActivity.this,"用户名或密码错误",Toast.LENGTH_SHORT).show();
        }


    }
}
