package com.example.zoglam.rubyonrailsapp;

import android.content.Context;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.CheckedTextView;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.Toast;
import com.google.gson.JsonObject;
import com.koushikdutta.ion.Ion;
import java.util.ArrayList;
import uk.co.chrisjenx.calligraphy.CalligraphyContextWrapper;

public class CreateActivity extends AppCompatActivity {

    private ListView projectsList;
    private EditText value;
    private RelativeLayout interceptor;
    static CheckedTextView checkedTextView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.createtodo_toolbar);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);

        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

        interceptor = (RelativeLayout) findViewById(R.id.createtodo_content);
        value= (EditText) findViewById(R.id.EditText);

        Bundle b = this.getIntent().getExtras();
        ArrayList<String> projectsArray = b.getStringArrayList("projectsArray");
        projectsList = (ListView) findViewById(R.id.projectsList);
        ProjectAdapter adapter = new ProjectAdapter(this, projectsArray);
        projectsList.setAdapter(adapter);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.my_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId())
        {
            case R.id.save:
                value = (EditText)findViewById(R.id.EditText);
                if (value.getText().length() > 3 && checkedTextView != null) {
                    JsonObject param = new JsonObject();
                    param.addProperty("text", value.getText().toString());
                    param.addProperty("project_id", checkedTextView.getId());
                    JsonObject params = new JsonObject();
                    params.add("newTodo", param);
                    Ion.with(getApplicationContext())
                            .load("POST", "http://95.165.148.222:3000/project")
                            .setJsonObjectBody(params).asJsonObject();
                    Toast.makeText(getApplicationContext(), getString(R.string.alarmGOOD), Toast.LENGTH_SHORT).show();
                    finish();
                }
                else Toast.makeText(getApplicationContext(), getString(R.string.alarmBAD), Toast.LENGTH_SHORT).show();
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    protected void attachBaseContext(Context newBase) {
        super.attachBaseContext(CalligraphyContextWrapper.wrap(newBase));
    }
}
