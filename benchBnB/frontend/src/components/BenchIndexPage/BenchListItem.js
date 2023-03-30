import { useSelector } from "react-redux"
import { useHistory } from "react-router-dom"

const BenchListItem = (props) => {
    // debugger
    let history = useHistory();
    const benchId = props.bench.id
    const bench = props.bench

    const handleClick = (e) => {
        e.preventDefault();
        // debugger
        history.push(`/benches/${benchId}`)
    }

    return (
        <div onClick={handleClick}>
            <h4>{bench.title}</h4>
            <h6>Price: {bench.price}</h6>
        </div>
    )
}

export default BenchListItem;