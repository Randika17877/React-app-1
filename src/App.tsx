import { useState } from "react";
import Alert from "./components/Alert";
import Button from "./components/Button/Button";
import ListGroup from "./components/ListGroup/ListGroup";
import './App.css';
import { BsFillCalendarFill } from "react-icons/bs";
import Like from "./components/Like";
function App() {

    const items=['New York', 'San Francisco', 'Tokyo', 'London', 'Paris'];

    return (
        <div>
            
            {/* <ListGroup 
            items={items}
            heading="Cities"
            onSelectItem={(item) => console.log(item)}
            /> */}

            {/* <BsFillCalendarFill color="red"/> */}

            {/* <Button color="primary" onClick={() => console.log('Clicked')}>Primary</Button> */}

            <Like onClick={() => console.log('clicked')}/>

        </div>
    );

}

export default App;
