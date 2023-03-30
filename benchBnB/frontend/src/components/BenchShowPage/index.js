import { Link, useParams } from "react-router-dom";
import { useSelector } from "react-redux";
import { useEffect } from "react";
import { useDispatch } from "react-redux";
import { fetchBench } from "../../store/benches";

const BenchShowPage = () => {
    // debugger
    const dispatch = useDispatch();
    const { benchId } = useParams();
    const bench = useSelector((state) => {
        return state?.benches ? state.benches[benchId] : null
    });

    useEffect(() => {
        if (benchId) {
            dispatch(fetchBench(benchId))
        }
    }, [dispatch, benchId])

    // debugger

    const returnValue = () => {
        if (!bench) {
            return null
        } else {
            return (
                <div>
                    <header>{bench.title}
                        <Link to='/'>All Benches</Link>
                    </header>
                    <header>Details
                        <p>{bench.description}</p>
                        <ul>Seats: {bench.seating}</ul>
                        <ul>Latitude: {bench.lat}</ul>
                        <ul>Longitude: {bench.lng}</ul>
                    </header>
                </div>
            )
        }
    }

    return (
        <div>{returnValue()}</div>
    )
}

export default BenchShowPage;