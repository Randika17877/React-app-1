import { useState } from "react";
import Alert from "./components/Alert";
import Button from "./components/Button";
import ListGroup from "./components/ListGroup/ListGroup";
import './App.css';
function App() {

    const items=['New York', 'San Francisco', 'Tokyo', 'London', 'Paris'];

    return (
        <div>
            
            <ListGroup 
            items={items}
            heading="Cities"
            onSelectItem={(item) => console.log(item)}
            />
        </div>
    );

}

export default App;
