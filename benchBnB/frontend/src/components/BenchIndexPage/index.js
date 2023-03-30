// import { useSelector } from "react-redux";
// import { fetchBenches } from "../../store/benches";
// import { useEffect, useDispatch } from "react";
import BenchList from './BenchList'

const BenchIndexPage = () => {
    // const dispatch = useDispatch;
    // const benches = useSelector((state) => state.benches)

    // useEffect(() => {
    //     dispatch(fetchBenches())
    // }, [])
    return (
        <BenchList />
    )
}

export default BenchIndexPage;