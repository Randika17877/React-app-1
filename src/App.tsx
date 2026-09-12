import Alert from "./components/Alert";
import Button from "./components/Button";
import ListGroup from "./components/ListGroup";
function App() {

    return (
        <div>
            <Button  onClick={() => console.log('clicked')}>
                My Button
            </Button>
        </div>
    );

}

export default App;
