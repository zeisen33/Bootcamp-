import { useDispatch, useSelector } from 'react-redux';
import { fetchBenches } from '../../store/benches';
import BenchListItem from './BenchListItem'
import React, { useEffect } from 'react';

const BenchList = () => {
    // debugger
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchBenches());
    }, []);

    const benches = useSelector((state) => Object.values(state.benches))

    const benchMap = () => { 
        return (
        benches.map((bench) => {
            // debugger
            return <BenchListItem key={bench.id} bench={bench} />
        }))
    }

    // debugger

    return (
        <>
            <h2>Benches</h2>
            {/* <ul>{benches.map(bench => (
                <BenchListItem bench={bench} />
            ))} */}
            {/* </ul> */}
            <ul>{benchMap()}</ul>
        </>
    )
}

export default BenchList;